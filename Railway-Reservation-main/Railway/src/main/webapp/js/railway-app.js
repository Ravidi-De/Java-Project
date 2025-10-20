/**
 * Railway Reservation System - Main JavaScript Framework
 * Provides common functionality and utilities across all pages
 */

(function() {
    'use strict';
    
    // Railway namespace
    window.Railway = window.Railway || {};
    
    /**
     * Configuration and Constants
     */
    Railway.config = {
        apiBaseUrl: window.location.origin + '/Railway',
        loadingDelay: 300,
        animationDuration: 300,
        debounceDelay: 300
    };
    
    /**
     * Utility Functions
     */
    Railway.utils = {
        /**
         * Debounce function to limit how often a function can fire
         */
        debounce: function(func, wait) {
            let timeout;
            return function executedFunction(...args) {
                const later = () => {
                    clearTimeout(timeout);
                    func(...args);
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
            };
        },
        
        /**
         * Format date to readable format
         */
        formatDate: function(dateString) {
            const options = { 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
            };
            return new Date(dateString).toLocaleDateString('en-US', options);
        },
        
        /**
         * Validate form data
         */
        validateForm: function(formElement) {
            const formData = new FormData(formElement);
            const errors = [];
            
            // Basic validation rules
            for (let [key, value] of formData.entries()) {
                const input = formElement.querySelector(`[name="${key}"]`);
                if (input && input.hasAttribute('required') && !value.trim()) {
                    errors.push(`${this.getFieldLabel(input)} is required`);
                }
                
                // Email validation
                if (input && input.type === 'email' && value && !this.isValidEmail(value)) {
                    errors.push(`${this.getFieldLabel(input)} must be a valid email`);
                }
                
                // Phone validation
                if (input && input.type === 'tel' && value && !this.isValidPhone(value)) {
                    errors.push(`${this.getFieldLabel(input)} must be a valid phone number`);
                }
            }
            
            return errors;
        },
        
        /**
         * Get field label for validation messages
         */
        getFieldLabel: function(input) {
            const label = input.closest('.form-group, .mb-3')?.querySelector('label');
            return label ? label.textContent.replace('*', '').trim() : input.name;
        },
        
        /**
         * Email validation
         */
        isValidEmail: function(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        },
        
        /**
         * Phone validation (basic)
         */
        isValidPhone: function(phone) {
            const phoneRegex = /^[\+]?[1-9][\d]{0,15}$/;
            return phoneRegex.test(phone.replace(/[\s\-\(\)]/g, ''));
        },
        
        /**
         * Show loading state
         */
        showLoading: function(element) {
            if (element) {
                element.disabled = true;
                element.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Loading...';
            } else {
                window.showLoading && window.showLoading();
            }
        },
        
        /**
         * Hide loading state
         */
        hideLoading: function(element, originalText) {
            if (element) {
                element.disabled = false;
                element.innerHTML = originalText || 'Submit';
            } else {
                window.hideLoading && window.hideLoading();
            }
        }
    };
    
    /**
     * Notification System
     */
    Railway.notifications = {
        /**
         * Show notification
         */
        show: function(message, type = 'info', duration = 5000) {
            const toast = this.createToast(message, type);
            document.body.appendChild(toast);
            
            // Trigger animation
            setTimeout(() => toast.classList.add('show'), 100);
            
            // Auto remove
            setTimeout(() => this.remove(toast), duration);
            
            return toast;
        },
        
        /**
         * Create toast element
         */
        createToast: function(message, type) {
            const toast = document.createElement('div');
            toast.className = `railway-toast railway-toast-${type} railway-slide-up`;
            toast.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 9999;
                padding: 12px 20px;
                border-radius: 8px;
                color: white;
                font-weight: 500;
                max-width: 350px;
                box-shadow: var(--railway-shadow-lg);
                transform: translateX(100%);
                transition: transform 0.3s ease;
                cursor: pointer;
            `;
            
            // Set background color based on type
            const colors = {
                success: 'var(--railway-success)',
                error: 'var(--railway-danger)',
                warning: 'var(--railway-warning)',
                info: 'var(--railway-primary)'
            };
            toast.style.backgroundColor = colors[type] || colors.info;
            
            // Add icon based on type
            const icons = {
                success: 'fas fa-check-circle',
                error: 'fas fa-exclamation-circle',
                warning: 'fas fa-exclamation-triangle',
                info: 'fas fa-info-circle'
            };
            
            toast.innerHTML = `
                <i class="${icons[type] || icons.info} me-2"></i>
                ${message}
                <i class="fas fa-times ms-2 opacity-75" style="cursor: pointer; float: right;"></i>
            `;
            
            // Add click to close functionality
            toast.addEventListener('click', () => this.remove(toast));
            
            return toast;
        },
        
        /**
         * Remove toast
         */
        remove: function(toast) {
            toast.style.transform = 'translateX(100%)';
            setTimeout(() => {
                if (toast.parentNode) {
                    toast.parentNode.removeChild(toast);
                }
            }, 300);
        },
        
        // Convenience methods
        success: function(message, duration) {
            return this.show(message, 'success', duration);
        },
        
        error: function(message, duration) {
            return this.show(message, 'error', duration);
        },
        
        warning: function(message, duration) {
            return this.show(message, 'warning', duration);
        },
        
        info: function(message, duration) {
            return this.show(message, 'info', duration);
        }
    };
    
    /**
     * Form Enhancement
     */
    Railway.forms = {
        /**
         * Initialize form enhancements
         */
        init: function() {
            this.enhanceAllForms();
            this.setupFormValidation();
            this.setupAutoSave();
        },
        
        /**
         * Enhance all forms on the page
         */
        enhanceAllForms: function() {
            const forms = document.querySelectorAll('form');
            forms.forEach(form => this.enhanceForm(form));
        },
        
        /**
         * Enhance individual form
         */
        enhanceForm: function(form) {
            // Add railway classes to form controls
            const inputs = form.querySelectorAll('input, select, textarea');
            inputs.forEach(input => {
                if (!input.classList.contains('railway-form-control')) {
                    input.classList.add('railway-form-control', 'form-control');
                }
            });
            
            // Add railway classes to labels
            const labels = form.querySelectorAll('label');
            labels.forEach(label => {
                if (!label.classList.contains('railway-form-label')) {
                    label.classList.add('railway-form-label', 'form-label');
                }
            });
            
            // Add railway classes to buttons
            const buttons = form.querySelectorAll('button[type="submit"], input[type="submit"]');
            buttons.forEach(button => {
                if (!button.classList.contains('railway-btn')) {
                    button.classList.add('railway-btn', 'railway-btn-primary');
                }
            });
        },
        
        /**
         * Setup form validation
         */
        setupFormValidation: function() {
            document.addEventListener('submit', (e) => {
                const form = e.target;
                if (form.tagName === 'FORM' && !form.hasAttribute('novalidate')) {
                    const errors = Railway.utils.validateForm(form);
                    
                    if (errors.length > 0) {
                        e.preventDefault();
                        Railway.notifications.error('Please fix the following errors:<br>' + errors.join('<br>'));
                        this.highlightErrors(form, errors);
                    }
                }
            });
        },
        
        /**
         * Highlight form errors
         */
        highlightErrors: function(form, errors) {
            // Remove previous error highlights
            form.querySelectorAll('.is-invalid').forEach(el => {
                el.classList.remove('is-invalid');
            });
            
            // Add error highlights to invalid fields
            const requiredFields = form.querySelectorAll('[required]');
            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    field.classList.add('is-invalid');
                }
            });
        },
        
        /**
         * Setup auto-save for forms (optional)
         */
        setupAutoSave: function() {
            const autosaveForms = document.querySelectorAll('[data-autosave]');
            autosaveForms.forEach(form => {
                const saveKey = form.getAttribute('data-autosave');
                
                // Load saved data
                this.loadFormData(form, saveKey);
                
                // Save on input
                const debouncedSave = Railway.utils.debounce(() => {
                    this.saveFormData(form, saveKey);
                }, 1000);
                
                form.addEventListener('input', debouncedSave);
            });
        },
        
        /**
         * Save form data to localStorage
         */
        saveFormData: function(form, key) {
            const formData = new FormData(form);
            const data = Object.fromEntries(formData.entries());
            localStorage.setItem(`railway_form_${key}`, JSON.stringify(data));
        },
        
        /**
         * Load form data from localStorage
         */
        loadFormData: function(form, key) {
            const savedData = localStorage.getItem(`railway_form_${key}`);
            if (savedData) {
                const data = JSON.parse(savedData);
                Object.entries(data).forEach(([name, value]) => {
                    const field = form.querySelector(`[name="${name}"]`);
                    if (field) field.value = value;
                });
            }
        }
    };
    
    /**
     * Table Enhancement
     */
    Railway.tables = {
        /**
         * Initialize table enhancements
         */
        init: function() {
            this.enhanceAllTables();
            this.setupSorting();
            this.setupFiltering();
        },
        
        /**
         * Enhance all tables on the page
         */
        enhanceAllTables: function() {
            const tables = document.querySelectorAll('table');
            tables.forEach(table => this.enhanceTable(table));
        },
        
        /**
         * Enhance individual table
         */
        enhanceTable: function(table) {
            if (!table.classList.contains('railway-table')) {
                table.classList.add('railway-table', 'table', 'table-hover');
            }
            
            // Wrap table for responsiveness
            if (!table.parentElement.classList.contains('table-responsive')) {
                const wrapper = document.createElement('div');
                wrapper.className = 'table-responsive';
                table.parentElement.insertBefore(wrapper, table);
                wrapper.appendChild(table);
            }
        },
        
        /**
         * Setup table sorting (basic)
         */
        setupSorting: function() {
            document.addEventListener('click', (e) => {
                const header = e.target.closest('th[data-sort]');
                if (header) {
                    const table = header.closest('table');
                    const column = header.getAttribute('data-sort');
                    this.sortTable(table, column);
                }
            });
        },
        
        /**
         * Sort table by column
         */
        sortTable: function(table, column) {
            // Basic sorting implementation
            // This is a simplified version - you might want to use a library for complex sorting
            console.log('Sorting table by column:', column);
            Railway.notifications.info('Table sorting feature coming soon!');
        },
        
        /**
         * Setup table filtering
         */
        setupFiltering: function() {
            const filterInputs = document.querySelectorAll('[data-table-filter]');
            filterInputs.forEach(input => {
                const tableId = input.getAttribute('data-table-filter');
                const table = document.getElementById(tableId);
                
                if (table) {
                    input.addEventListener('input', Railway.utils.debounce(() => {
                        this.filterTable(table, input.value);
                    }, 300));
                }
            });
        },
        
        /**
         * Filter table rows
         */
        filterTable: function(table, searchTerm) {
            const rows = table.querySelectorAll('tbody tr');
            const term = searchTerm.toLowerCase();
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(term) ? '' : 'none';
            });
        }
    };
    
    /**
     * Initialize all Railway components when DOM is loaded
     */
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Railway System initializing...');
        
        // Initialize components
        Railway.forms.init();
        Railway.tables.init();
        
        // Setup global keyboard shortcuts
        document.addEventListener('keydown', (e) => {
            // ESC to close modals/notifications
            if (e.key === 'Escape') {
                const toasts = document.querySelectorAll('.railway-toast');
                toasts.forEach(toast => Railway.notifications.remove(toast));
            }
        });
        
        // Setup smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
        
        console.log('Railway System initialized successfully!');
        Railway.notifications.success('Welcome to Railway Reservation System!', 3000);
    });
    
})();